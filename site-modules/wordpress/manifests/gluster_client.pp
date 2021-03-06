class wordpress::gluster_client{

	class { ::gluster::install:
		server  => true,
		client  => true,
		repo    => false,
	  }
	  
	   class { ::gluster::service:
		ensure  => running,
		require => Class[::gluster::install],
	  }
	  
	    file { ['/export/', '/export/brick1/', '/export/brick1/brick/']:
		ensure => 'directory',
	  }
	  


	gluster::mount { '/mnt/':
	  volume  => 'localhost:/g0',
	  atboot  => true,
	  options => 'noatime,nodev,noexec,nosuid',
}->

	file { '/mnt/wp/':
		ensure => 'directory',
	  }

}
