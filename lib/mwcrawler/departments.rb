module Mwcrawler
  module Departments
    def self.scrap(id_campus)
      # CADA DEPARTAMENTO SERÁ UMA LINHA, ENTÃO rows É O CONJUNTO DE TODOS OS DEPARTAMENTOS
      rows = []

    	page = Helpers.set_crawler(id_campus,'graduacao/oferta_dep.aspx?cod=')
      departments = page.css('#datatable tr td').map { |item| item.text }

      while !departments.empty?
        row = {}
        row['code'] = departments.shift
        row['acronym'] = departments.shift
        row['name'] = departments.shift
        rows << row
      end

      rows
    end
  end
end
