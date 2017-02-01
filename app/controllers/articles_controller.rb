class ArticlesController < ApplicationController
    def index
        @articles = Article.all    
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        #Creating a new article
        #article_params e.g title: "Title of article", description: "Title description"
        #article.save returns a boolean, depending on the validations set up in the model
        #Notify the user and redirect to show path See rake routes
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully saved"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def destroy
        @article = Article.find(params[:id])    
        @article.destroy
        flash[:notice] = "Article was succesfully destroyed"
        redirect_to articles_path
    end
    
    private
    def article_params
       params.require(:article).permit(:title,:description) 
    end
end