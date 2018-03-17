class ApiVersionConstraint

    def initialize(options)
        @version = options[:version]
        @default = options[:default]
    end

    def matches?(req)
        # Verifica o cabeçario da requisicão a versão da api usada
        @default || req.headers['Accept'].include?("appication/vnd.taskmanager.v#{@version}")
    end
end