package com.danzhao.bean;

import java.util.ArrayList;
import java.util.List;

public class ExamroomExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ExamroomExample() {
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

        public Criteria andEridIsNull() {
            addCriterion("erId is null");
            return (Criteria) this;
        }

        public Criteria andEridIsNotNull() {
            addCriterion("erId is not null");
            return (Criteria) this;
        }

        public Criteria andEridEqualTo(Integer value) {
            addCriterion("erId =", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotEqualTo(Integer value) {
            addCriterion("erId <>", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridGreaterThan(Integer value) {
            addCriterion("erId >", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridGreaterThanOrEqualTo(Integer value) {
            addCriterion("erId >=", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridLessThan(Integer value) {
            addCriterion("erId <", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridLessThanOrEqualTo(Integer value) {
            addCriterion("erId <=", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridIn(List<Integer> values) {
            addCriterion("erId in", values, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotIn(List<Integer> values) {
            addCriterion("erId not in", values, "erid");
            return (Criteria) this;
        }

        public Criteria andEridBetween(Integer value1, Integer value2) {
            addCriterion("erId between", value1, value2, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotBetween(Integer value1, Integer value2) {
            addCriterion("erId not between", value1, value2, "erid");
            return (Criteria) this;
        }

        public Criteria andErnameIsNull() {
            addCriterion("erName is null");
            return (Criteria) this;
        }

        public Criteria andErnameIsNotNull() {
            addCriterion("erName is not null");
            return (Criteria) this;
        }

        public Criteria andErnameEqualTo(String value) {
            addCriterion("erName =", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameNotEqualTo(String value) {
            addCriterion("erName <>", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameGreaterThan(String value) {
            addCriterion("erName >", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameGreaterThanOrEqualTo(String value) {
            addCriterion("erName >=", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameLessThan(String value) {
            addCriterion("erName <", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameLessThanOrEqualTo(String value) {
            addCriterion("erName <=", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameLike(String value) {
            addCriterion("erName like", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameNotLike(String value) {
            addCriterion("erName not like", value, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameIn(List<String> values) {
            addCriterion("erName in", values, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameNotIn(List<String> values) {
            addCriterion("erName not in", values, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameBetween(String value1, String value2) {
            addCriterion("erName between", value1, value2, "ername");
            return (Criteria) this;
        }

        public Criteria andErnameNotBetween(String value1, String value2) {
            addCriterion("erName not between", value1, value2, "ername");
            return (Criteria) this;
        }

        public Criteria andErtypeIsNull() {
            addCriterion("erType is null");
            return (Criteria) this;
        }

        public Criteria andErtypeIsNotNull() {
            addCriterion("erType is not null");
            return (Criteria) this;
        }

        public Criteria andErtypeEqualTo(Integer value) {
            addCriterion("erType =", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeNotEqualTo(Integer value) {
            addCriterion("erType <>", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeGreaterThan(Integer value) {
            addCriterion("erType >", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("erType >=", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeLessThan(Integer value) {
            addCriterion("erType <", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeLessThanOrEqualTo(Integer value) {
            addCriterion("erType <=", value, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeIn(List<Integer> values) {
            addCriterion("erType in", values, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeNotIn(List<Integer> values) {
            addCriterion("erType not in", values, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeBetween(Integer value1, Integer value2) {
            addCriterion("erType between", value1, value2, "ertype");
            return (Criteria) this;
        }

        public Criteria andErtypeNotBetween(Integer value1, Integer value2) {
            addCriterion("erType not between", value1, value2, "ertype");
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

        public Criteria andTestRoomListIsNull() {
            addCriterion("test_room_list is null");
            return (Criteria) this;
        }

        public Criteria andTestRoomListIsNotNull() {
            addCriterion("test_room_list is not null");
            return (Criteria) this;
        }

        public Criteria andTestRoomListEqualTo(String value) {
            addCriterion("test_room_list =", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListNotEqualTo(String value) {
            addCriterion("test_room_list <>", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListGreaterThan(String value) {
            addCriterion("test_room_list >", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListGreaterThanOrEqualTo(String value) {
            addCriterion("test_room_list >=", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListLessThan(String value) {
            addCriterion("test_room_list <", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListLessThanOrEqualTo(String value) {
            addCriterion("test_room_list <=", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListLike(String value) {
            addCriterion("test_room_list like", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListNotLike(String value) {
            addCriterion("test_room_list not like", value, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListIn(List<String> values) {
            addCriterion("test_room_list in", values, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListNotIn(List<String> values) {
            addCriterion("test_room_list not in", values, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListBetween(String value1, String value2) {
            addCriterion("test_room_list between", value1, value2, "testRoomList");
            return (Criteria) this;
        }

        public Criteria andTestRoomListNotBetween(String value1, String value2) {
            addCriterion("test_room_list not between", value1, value2, "testRoomList");
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