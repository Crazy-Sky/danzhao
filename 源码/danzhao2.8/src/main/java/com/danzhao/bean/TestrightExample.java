package com.danzhao.bean;

import java.util.ArrayList;
import java.util.List;

public class TestrightExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TestrightExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andRightidIsNull() {
            addCriterion("rightid is null");
            return (Criteria) this;
        }

        public Criteria andRightidIsNotNull() {
            addCriterion("rightid is not null");
            return (Criteria) this;
        }

        public Criteria andRightidEqualTo(Integer value) {
            addCriterion("rightid =", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidNotEqualTo(Integer value) {
            addCriterion("rightid <>", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidGreaterThan(Integer value) {
            addCriterion("rightid >", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidGreaterThanOrEqualTo(Integer value) {
            addCriterion("rightid >=", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidLessThan(Integer value) {
            addCriterion("rightid <", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidLessThanOrEqualTo(Integer value) {
            addCriterion("rightid <=", value, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidIn(List<Integer> values) {
            addCriterion("rightid in", values, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidNotIn(List<Integer> values) {
            addCriterion("rightid not in", values, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidBetween(Integer value1, Integer value2) {
            addCriterion("rightid between", value1, value2, "rightid");
            return (Criteria) this;
        }

        public Criteria andRightidNotBetween(Integer value1, Integer value2) {
            addCriterion("rightid not between", value1, value2, "rightid");
            return (Criteria) this;
        }

        public Criteria andDeptidIsNull() {
            addCriterion("deptid is null");
            return (Criteria) this;
        }

        public Criteria andDeptidIsNotNull() {
            addCriterion("deptid is not null");
            return (Criteria) this;
        }

        public Criteria andDeptidEqualTo(Integer value) {
            addCriterion("deptid =", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotEqualTo(Integer value) {
            addCriterion("deptid <>", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidGreaterThan(Integer value) {
            addCriterion("deptid >", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidGreaterThanOrEqualTo(Integer value) {
            addCriterion("deptid >=", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidLessThan(Integer value) {
            addCriterion("deptid <", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidLessThanOrEqualTo(Integer value) {
            addCriterion("deptid <=", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidIn(List<Integer> values) {
            addCriterion("deptid in", values, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotIn(List<Integer> values) {
            addCriterion("deptid not in", values, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidBetween(Integer value1, Integer value2) {
            addCriterion("deptid between", value1, value2, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotBetween(Integer value1, Integer value2) {
            addCriterion("deptid not between", value1, value2, "deptid");
            return (Criteria) this;
        }

        public Criteria andRightnameIsNull() {
            addCriterion("rightname is null");
            return (Criteria) this;
        }

        public Criteria andRightnameIsNotNull() {
            addCriterion("rightname is not null");
            return (Criteria) this;
        }

        public Criteria andRightnameEqualTo(String value) {
            addCriterion("rightname =", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameNotEqualTo(String value) {
            addCriterion("rightname <>", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameGreaterThan(String value) {
            addCriterion("rightname >", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameGreaterThanOrEqualTo(String value) {
            addCriterion("rightname >=", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameLessThan(String value) {
            addCriterion("rightname <", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameLessThanOrEqualTo(String value) {
            addCriterion("rightname <=", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameLike(String value) {
            addCriterion("rightname like", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameNotLike(String value) {
            addCriterion("rightname not like", value, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameIn(List<String> values) {
            addCriterion("rightname in", values, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameNotIn(List<String> values) {
            addCriterion("rightname not in", values, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameBetween(String value1, String value2) {
            addCriterion("rightname between", value1, value2, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightnameNotBetween(String value1, String value2) {
            addCriterion("rightname not between", value1, value2, "rightname");
            return (Criteria) this;
        }

        public Criteria andRightvalueIsNull() {
            addCriterion("rightvalue is null");
            return (Criteria) this;
        }

        public Criteria andRightvalueIsNotNull() {
            addCriterion("rightvalue is not null");
            return (Criteria) this;
        }

        public Criteria andRightvalueEqualTo(Integer value) {
            addCriterion("rightvalue =", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueNotEqualTo(Integer value) {
            addCriterion("rightvalue <>", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueGreaterThan(Integer value) {
            addCriterion("rightvalue >", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueGreaterThanOrEqualTo(Integer value) {
            addCriterion("rightvalue >=", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueLessThan(Integer value) {
            addCriterion("rightvalue <", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueLessThanOrEqualTo(Integer value) {
            addCriterion("rightvalue <=", value, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueIn(List<Integer> values) {
            addCriterion("rightvalue in", values, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueNotIn(List<Integer> values) {
            addCriterion("rightvalue not in", values, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueBetween(Integer value1, Integer value2) {
            addCriterion("rightvalue between", value1, value2, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightvalueNotBetween(Integer value1, Integer value2) {
            addCriterion("rightvalue not between", value1, value2, "rightvalue");
            return (Criteria) this;
        }

        public Criteria andRightparentidIsNull() {
            addCriterion("rightparentid is null");
            return (Criteria) this;
        }

        public Criteria andRightparentidIsNotNull() {
            addCriterion("rightparentid is not null");
            return (Criteria) this;
        }

        public Criteria andRightparentidEqualTo(Integer value) {
            addCriterion("rightparentid =", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidNotEqualTo(Integer value) {
            addCriterion("rightparentid <>", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidGreaterThan(Integer value) {
            addCriterion("rightparentid >", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidGreaterThanOrEqualTo(Integer value) {
            addCriterion("rightparentid >=", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidLessThan(Integer value) {
            addCriterion("rightparentid <", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidLessThanOrEqualTo(Integer value) {
            addCriterion("rightparentid <=", value, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidIn(List<Integer> values) {
            addCriterion("rightparentid in", values, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidNotIn(List<Integer> values) {
            addCriterion("rightparentid not in", values, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidBetween(Integer value1, Integer value2) {
            addCriterion("rightparentid between", value1, value2, "rightparentid");
            return (Criteria) this;
        }

        public Criteria andRightparentidNotBetween(Integer value1, Integer value2) {
            addCriterion("rightparentid not between", value1, value2, "rightparentid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}