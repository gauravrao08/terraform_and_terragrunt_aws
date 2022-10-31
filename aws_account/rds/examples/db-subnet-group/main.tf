module "db_subnet_group" {
  source = "../../../../../../../modules/rds/modules/db_subnet_group/"
  name = "gaurav_subnet_group"          ## update dh subnet group name
  description = "rao-sab"             ## update description of db subnet group
  #######################################################
  subnet_ids = data.aws_subnets.subnet_ids.ids        ## this will include all the subnet which have subnet_type = private
  ##subnet_ids = [data.aws_subnet.subnet_a.id, data.aws_subnet.subnet_b.id]   ##if you want to provide specific subnet 2 only
  #####################################################
  use_name_prefix = false           ## always false

  tags = {  
    Owner        = "GAURAV"       ## update
    Environment = "dev"           ##update
    Product     = "adidas"        #update
    db_subnet_grp = "adicode"         ## update 
    manage-by     = "terrform"      ## Dont remove this tags

  }
}
