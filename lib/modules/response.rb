=begin
**************************************************************************
  *  OPENMOBILE WORLD WIDE INC. CONFIDENTIAL & PROPRIETARY
  * (c) 2011-12 OpenMobile World Wide Inc., Framingham, MA USA
  * All rights reserved
  *
  * NOTICE: All information contained herein is, and remains the sole property
  * of OpenMobile World Wide Inc.  The intellectual and technical concepts
  * contained herein are the sole property of OpenMobile World Wide Inc. and is
  * protected by copyrights and trade secret law.  In addition it may be
  * protected by US and Foreign Patents, or Patents pending.
  * Dissemination of this information and/or reproduction of this material
  * is strictly forbidden without the written  permission of  OpenMobile World Wide Inc.
  *
**************************************************************************
=end

=begin
  This module defines the basic structure of the output data. 
=end
module Response
  class Data 
    attr_accessor :TotalPages, 
                  :Message, :NextPage, 
                  :PreviousPage, :CurrentPage, 
                  :Response, :Data
                  
                  
    def initialize(input = {})
      @TotalPages, @Message, @NextPage, @PreviousPage, @CurrentPage, @Response = input[:TotalPages], input[:Message], input[:NextPage], input[:PreviousPage], input[:CurrentPage], input[:Response]
      @Data = []
    end
  end  
end