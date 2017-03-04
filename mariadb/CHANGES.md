##Maria DB
    1) values
    	max_allowed_packet = 32mb (2 places)
    2) comment out
        #log_bin                = /var/log/mysql/mariadb-bin
        #log_bin_index          = /var/log/mysql/mariadb-bin.index
        #expire_logs_days       = 10
        #max_binlog_size        = 100M
    3) comment out (allowing remote access)
	    #bind-address           = 127.0.0.1

	4) Fine Tuning
	    max_connections			= 500
	    connect_timeout			= 5
	    wait_timeout			= 600
	    max_allowed_packet		= 32M
	    thread_cache_size		= 128
	    sort_buffer_size		= 16M
	    bulk_insert_buffer_size	= 16M
	    tmp_table_size			= 128M
	    max_heap_table_size		= 128M
