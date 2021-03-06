class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    # @articles 3 Article.all.order("id DESC").limit(15)

    # articles = Article.al3
    # @articles = articles.order("articles.picks.last.id DESC").limit(15)
    @article = Article.new
    @picks = Pick.all.order("updated_at DESC").uniq(:id).limit(20)
    @articles = Article.all.order("updated_at DESC").uniq(:id).limit(60)
  end

  def show
    @article = Article.find(params[:id])
    @desc_picks = @article.picks.order("id DESC")
    @picks = Pick.all.order("id DESC")
    @tag = Tag.new
    @tags = @article.tags.uniq
    # if current_user.picks.map{|i| [:article_id] == params[:id]}
    # binding.pry
    # if @article.users.ids.include?(current_user.id)
    # if @article.picks.map{|i| i[:user_id].to_i}.include?(current_user.id)
    #   @pick = Pick.where(article_id: params[:id]).where(user_id: current_user.id)[0]
    # else
    #   @pick = Pick.new
    # end
    @pick = Pick.where(article_id: params[:id]).find_or_initialize_by(user_id: current_user.id) if user_signed_in?
  end

  # GET /articles/new
  def new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create

    if params[:article][:url].present?
      article = Article.create(article_params)
      article.picks.create( user_id: current_user.id)
    end
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to root_path
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.update(tag_params) if params[:article].present?
    redirect_to @article
    # respond_to do |format|
    #   if @article.update(article_params)
    #   redirect_to @article
    #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @article }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      # カリキュラム終了後にサービスクラスに移行予定

      agent = Mechanize.new
      page = agent.get(params[:article][:url])
      content = page.at('meta[property="og:description"]')[:content]
      site_name = page.at('meta[property="og:site_name"]')[:content] if page.at('meta[property="og:site_name"]')[:content].present?
      if page.at('meta[property="og:image"]')[:content].present?
        site_image = page.at('meta[property="og:image"]')[:content]
      elsif page.at('meta[name="twitter:image"]')[:content].present?
        site_image = page.at('meta[name="twitter:image"]')[:content]
      else
        site_image = nil
      end
      # カリキュラム終了後にサービスクラスに移行予定
      # params.require(:article).permit(:title, :image, :source)
      params.require(:article).permit(:url).merge(title: page.title,text: content,source: site_name, image: site_image)

    end
    def tag_params
      params.require(:article).permit({tag_ids: []})
    end
end
