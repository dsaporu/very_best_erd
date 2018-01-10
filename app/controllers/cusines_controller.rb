class CusinesController < ApplicationController
  def index
    @cusines = Cusine.page(params[:page]).per(10)

    render("cusines/index.html.erb")
  end

  def show
    @dish = Dish.new
    @cusine = Cusine.find(params[:id])

    render("cusines/show.html.erb")
  end

  def new
    @cusine = Cusine.new

    render("cusines/new.html.erb")
  end

  def create
    @cusine = Cusine.new

    @cusine.name = params[:name]

    save_status = @cusine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cusines/new", "/create_cusine"
        redirect_to("/cusines")
      else
        redirect_back(:fallback_location => "/", :notice => "Cusine created successfully.")
      end
    else
      render("cusines/new.html.erb")
    end
  end

  def edit
    @cusine = Cusine.find(params[:id])

    render("cusines/edit.html.erb")
  end

  def update
    @cusine = Cusine.find(params[:id])

    @cusine.name = params[:name]

    save_status = @cusine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cusines/#{@cusine.id}/edit", "/update_cusine"
        redirect_to("/cusines/#{@cusine.id}", :notice => "Cusine updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cusine updated successfully.")
      end
    else
      render("cusines/edit.html.erb")
    end
  end

  def destroy
    @cusine = Cusine.find(params[:id])

    @cusine.destroy

    if URI(request.referer).path == "/cusines/#{@cusine.id}"
      redirect_to("/", :notice => "Cusine deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cusine deleted.")
    end
  end
end
