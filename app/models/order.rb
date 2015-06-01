class Order < ActiveRecord::Base
    
    validates :order_name, :presence => true
    #after_validation :reverse_geocode
    #before_create :reverse_geocode
    belongs_to :user
    
   
   # reverse_geocoded_by :lat, :long do |obj,results|
    #geo = results.first
    #p geo
    #end
    
    
    
    
    
    
    def self.search(search)
        if search
            Order.where('order_name LIKE ?', "%#{search}%")
        else
            Order.all
        end
       #find(:all, :conditions => ['order_name LIKE ?', search_condition])
    end
    
    def self.import(file)
        #sheetsheet = Roo::Spreadsheet.open(file.path)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        order = find_by_id(row["id"]) || new
        order.attributes = row.to_hash.slice(*row.to_hash.keys)
        p order.attributes
        p"==========================="
        order.save!
         end
    end
    
   
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
       when '.csv' then Roo::CSV.new(file.path, nil, :ignore)
       when '.xls' then Roo::Excel.new(file.path)
       #Roo::Excelx.new(tempfile.path, )
       when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
       else raise "Unknown file type: #{file.original_filename}"
      end
    end
    
end
