class PeopleController < ApplicationController
  def index
    load_people
  end

  def show
    load_person
    @message = @person.messages.build
  end

  def new
    build_person
  end

  def create
    build_person
    save_person('created') || render('new')
  end

  def edit
    load_person
    build_person
  end

  def update
    load_person
    build_person
    save_person('updated') || render('edit')
  end

  def destroy
    load_person
    @person.destroy
    redirect_to people_path, notice: "#{@person.name} has been deleted"
  end

  private

  def load_people
    @people ||= people
  end

  def load_person
    @person ||= people.find(params[:id])
  end

  def build_person
    @person ||= people.build
    @person.attributes = person_params
  end

  def save_person(action)
    redirect_to @person, notice: "#{@person.name} has been #{action}" if @person.save
  end

  def people
    Person.all.sorted
  end

  def person_params
    person_params = params[:person]
    person_params ? person_params.permit(:name, :job_title, :bio) : {}
  end
end
