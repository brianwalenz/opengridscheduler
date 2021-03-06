/*___INFO__MARK_BEGIN__*/
/*************************************************************************
 *
 *  The Contents of this file are made available subject to the terms of
 *  the Sun Industry Standards Source License Version 1.2
 *
 *  Sun Microsystems Inc., March, 2001
 *
 *
 *  Sun Industry Standards Source License Version 1.2
 *  =================================================
 *  The contents of this file are subject to the Sun Industry Standards
 *  Source License Version 1.2 (the "License"); You may not use this file
 *  except in compliance with the License. You may obtain a copy of the
 *  License at http://gridengine.sunsource.net/Gridengine_SISSL_license.html
 *
 *  Software provided under this License is provided on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
 *  WITHOUT LIMITATION, WARRANTIES THAT THE SOFTWARE IS FREE OF DEFECTS,
 *  MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE, OR NON-INFRINGING.
 *  See the License for the specific provisions governing your rights and
 *  obligations concerning the Software.
 *
 *   The Initial Developer of the Original Code is: Sun Microsystems, Inc.
 *
 *   Copyright: 2001 by Sun Microsystems, Inc.
 *
 *   All Rights Reserved.
 *
 ************************************************************************/
/*___INFO__MARK_END__*/
/**
 *  Generated from java_jmx_jgdi.jsp
 *  !!! DO NOT EDIT THIS FILE !!!
 */
 

<%
  final com.sun.grid.cull.JavaHelper jh = (com.sun.grid.cull.JavaHelper)params.get("javaHelper");
  final com.sun.grid.cull.CullDefinition cullDef = (com.sun.grid.cull.CullDefinition)params.get("cullDef");
  
  final java.util.logging.Logger logger = java.util.logging.Logger.getLogger("cullconv");

  class JGDIJMXGenerator extends com.sun.grid.cull.AbstractGDIGenerator {
     
     public JGDIJMXGenerator(com.sun.grid.cull.CullObject cullObject) {
        super(cullObject.getIdlName(), jh.getClassName(cullObject), cullObject);
        addPrimaryKeys(cullObject, jh);
     }
     
     public void genImport() {
        if (!(cullObject.getType() == cullObject.TYPE_PRIMITIVE || 
             cullObject.getType() == cullObject.TYPE_MAPPED)) {
%>import com.sun.grid.jgdi.configuration.<%=classname%>;
<%        
        }
     }

public void genUpdateMethod() {
%>
   /**
    *   Update a <code><%=name%></code> object.
    *   @param obj   the <code><%=name%></code> object with the new values
    *   @throws JGDIException on any error on the GDI layer
    */
   public void update<%=name%>(<%=classname%> obj) throws JGDIException;

   /**
    *   Update a <code><%=name%></code> object.
    *   @param obj      the <code><%=name%></code> object with the new values
    *   @param answers  the <code>answer list</code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void update<%=name%>WithAnswer(<%=classname%> obj, List<JGDIAnswer> answers) throws JGDIException;
<%
    } // end of genUpdateMethod

    public void genGetMethod() {
%>
   /**
    *   Get the <code><%=name%></code> object.
    *   @return the <code><%=classname%></code> object
    *   @throws JGDIException on any error
    */
   public <%=classname%> get<%=name%>() throws JGDIException;

   /**
    *   Get the <code><%=name%></code> object.
    *   @param answers  the <code>answer list</code> object
    *   @return the <code><%=classname%></code> object.
    *   @throws JGDIException on any error on the GDI layer
    */
   public <%=classname%> get<%=name%>WithAnswer(List<JGDIAnswer> answers) throws JGDIException;
<%
} // end of genGetMethod

public void genGetListMethod() {
%>
   /**
    *   Get the list of all defined <code><%=name%></code> objects.
    *   @return list of <code><%=name%></code> objects
    *   @throws JGDIException on any error on the GDI layer
    */
   public List< <%=classname%> > get<%=name%>List() throws JGDIException;
   /**
    *   Get the list of all defined <code><%=name%></code> objects.
    *   @param answers  the <code>answer list</code> object    
    *   @return list of <code><%=name%></code> objects
    *   @throws JGDIException on any error on the GDI layer
    */
   public List< <%=classname%> > get<%=name%>ListWithAnswer(List<JGDIAnswer> answers) throws JGDIException;
   
<%
} // end of genGetListMethod
     
public void genAddMethod() {
%>   
   /**
    *   Add a new <code><%=name%></code> object.
    *   @param  obj      the new <code><%=name%></code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void add<%=name%>(<%=classname%> obj) throws JGDIException;

   /**
    *   Add a new <code><%=name%></code> object.
    *   @param obj       the new <code><%=name%></code> object
    *   @param answers   the <code>answer list</code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void add<%=name%>WithAnswer(<%=classname%> obj, List<JGDIAnswer> answers) throws JGDIException;

<% if ((name.equals("Manager")) || 
       (name.equals("Operator")) ||
       (name.equals("AdminHost")) || 
       (name.equals("SubmitHost"))) { %>
   /**
    *   Add a new <code><%=name%></code> object.
    *   @param  name the new <code>String</code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void add<%=name%>(String name) throws JGDIException;

   /**
    *   Add a new <code><%=name%></code> object.
    *   @param  name the new <code>String</code> object
    *   @param  answers the <code>answer list</code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void add<%=name%>WithAnswer(String name, List<JGDIAnswer> answers) throws JGDIException;

<%
     } // end if name.equals()
   } // end of genAddMethod

public void genDeleteMethod() {
%>
   /**
    *   Delete a <code><%=name%></code> object.
    *   @param obj  <code><%=name%></code> object with the primary key information
    *   @throws JGDIException on any error on the GDI layer
    */
   public void delete<%=name%>(<%=classname%> obj) throws JGDIException;
   
   /**
    *   Delete a <code><%=name%></code> object.
    *   @param obj       the <code><%=name%></code> object with the primary key information
    *   @param answers   the <code>answer list</code> object
    *   @throws JGDIException on any error on the GDI layer
    */
   public void delete<%=name%>WithAnswer(<%=classname%> obj, List<JGDIAnswer> answers) throws JGDIException;

<%
} // end of genDeleteMethod

public void genDeleteByPrimaryKeyMethod() {
%>
   /**
    *   Delete a <code><%=name%></code> object by its primary key
<%
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
%>    *  @param <%=pkName%>   the <%=pkName%> of the <code><%=name%></code> object
<%  } // end of for
%>    *  @throws JGDIException on any error on the GDI layer
    */
   public void delete<%=name%>(<%
      boolean first = true;
      for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
          String pkName = entry.getKey();
          String pkType = entry.getValue();
          if (first) {
             first = false;
          } else { %> , <%           
       } %> <%=pkType%> <%=pkName%> <%
    } // end of for  
    %>) throws JGDIException;
   /**
    *   Delete a <code><%=name%></code> object by its primary key
<%
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
%>    *  @param <%=pkName%>   the <%=pkName%> of the <code><%=name%></code> object
<% 
    } // end of for    
%>    *  @param answers   the <code>answer list</code> object
    *  @throws JGDIException on any error on the GDI layer
    */
   public void delete<%=name%>WithAnswer(<%
      first = true;  
      for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
          String pkName = entry.getKey();
          String pkType = entry.getValue();
          if (first) {
              first = false;
          } else { %> , <%           
       } %> <%=pkType%> <%=pkName%> <%
    } // end of for
    %>, List<JGDIAnswer> answers) throws JGDIException;


   /**
    *   Delete several <code><%=name%></code> objects by their primary key
<%
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       // String pkType = entry.getValue();
%>    *  @param <%=pkName%>s   array of <%=pkName%> of the <code><%=name%></code> objects
<%
    } // end of for
%>    *  @param answers   the <code>answer list</code> object
    *  @throws JGDIException on any error on the GDI layer
    */
   public void delete<%=name%>sWithAnswer(<%
    first = true;
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       // String pkType = entry.getValue();
       if (first) {
         first = false;
       } else {
            %> , <%           
       } 
       %> String[] <%=pkName%>s <%
    } // end of for
    %>
<% if (name.equals("Job") || name.equals("AdvanceReservation")) {%>
    , boolean forced, UserFilter userFilter
<% }%>    , List<JGDIAnswer> answers) throws JGDIException;
<%
} // end of genDeleteByPrimaryKeyMethod

public void genGetByPrimaryKeyMethod() {
%>
   /**
    *  Get a <%=name%> by its primary key
    *
    *  @return the <%=name%>
<%
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
%>    *  @param <%=pkName%>   the <%=pkName%> of the <code><%=name%></code> object
<%
    } // end of for
%>    *  @return the found <code><%=name%></code> object of <code>null</code>    
    *  @throws JGDIException on any error on the GDI layer
    */
   public <%=classname%> get<%=name%>(<%
    boolean first = true;  
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
       if (first) {
         first = false;
       } else {
            %> , <%           
       } 
       %> <%=pkType%> <%=pkName%> <%
    } // end of for
    %>) throws JGDIException;

   /**
    *  Get a <%=name%> by its primary key
    *
    *  @return the <%=name%>
<%
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
%>    *  @param <%=pkName%>   the <%=pkName%> of the <code><%=name%></code> object
<%
    } // end of for
%>   *  @param answers   the <code>answer list</code> object  
    *  @return the found <code><%=name%></code> object of <code>null</code>    
    *  @throws JGDIException on any error on the GDI layer
    */
   public <%=classname%> get<%=name%>WithAnswer(<%
    first = true;  
    for (java.util.Map.Entry<String, String> entry: primaryKeys.entrySet()) {
       String pkName = entry.getKey();
       String pkType = entry.getValue();
       if (first) {
         first = false;
       } else {
            %> , <%           
       } 
       %> <%=pkType%> <%=pkName%> <%
    } // end of for
    %>, List<JGDIAnswer> answers) throws JGDIException;

<%
     } // end of genGetByPrimaryKeyMethod
} // end of class JGDIJMXGenerator
  
  // --------------------------------------------------------------------------
  // Build all generator instances
  // --------------------------------------------------------------------------
  java.util.List<JGDIJMXGenerator> generators = new java.util.ArrayList<JGDIJMXGenerator>();
  for (String name : cullDef.getObjectNames()) {
    com.sun.grid.cull.CullObject cullObj = cullDef.getCullObject(name);
    logger.fine("JGDIJMXGenerator->handle " + cullObj.getName() + "(" + cullObj.getOperationString() +")");
    generators.add(new JGDIJMXGenerator(cullObj));
  }
%>

package com.sun.grid.jgdi.management.mbeans;


import java.util.List;
import com.sun.grid.jgdi.JGDIException;
import com.sun.grid.jgdi.configuration.JGDIAnswer;
import com.sun.grid.jgdi.monitoring.filter.UserFilter;

<% // Import all cull object names;
   for (JGDIJMXGenerator gen : generators) {
     gen.genImport();
   }
%>

/**
 *   JGDIMBean interface of {@link com.sun.grid.jgdi.JGDI} for a JMX service.
 *   Defines all methods as {@link com.sun.grid.jgdi.JGDI}, but throws a
 */
public interface JGDIJMXMBean extends JGDIJMXBaseMBean {
<%
  for (JGDIJMXGenerator gen : generators) {
     gen.genMethods();
  }
%>

}
