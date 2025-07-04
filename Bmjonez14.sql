PGDMP                      }        	   Gradebook    17.4    17.4     )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            ,           1262    16388 	   Gradebook    DATABASE     q   CREATE DATABASE "Gradebook" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "Gradebook";
                     postgres    false            �            1259    16397    assignments    TABLE     �   CREATE TABLE public.assignments (
    assignment_id integer NOT NULL,
    title character varying(100),
    description text,
    due_date date,
    student_id integer
);
    DROP TABLE public.assignments;
       public         heap r       postgres    false            �            1259    16396    assignments_assignment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assignments_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.assignments_assignment_id_seq;
       public               postgres    false    220            -           0    0    assignments_assignment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.assignments_assignment_id_seq OWNED BY public.assignments.assignment_id;
          public               postgres    false    219            �            1259    16390    students    TABLE     �   CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    enrollment_date date
);
    DROP TABLE public.students;
       public         heap r       postgres    false            �            1259    16389    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.students_student_id_seq;
       public               postgres    false    218            .           0    0    students_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;
          public               postgres    false    217            �           2604    16400    assignments assignment_id    DEFAULT     �   ALTER TABLE ONLY public.assignments ALTER COLUMN assignment_id SET DEFAULT nextval('public.assignments_assignment_id_seq'::regclass);
 H   ALTER TABLE public.assignments ALTER COLUMN assignment_id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    16393    students student_id    DEFAULT     z   ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);
 B   ALTER TABLE public.students ALTER COLUMN student_id DROP DEFAULT;
       public               postgres    false    218    217    218            &          0    16397    assignments 
   TABLE DATA           ^   COPY public.assignments (assignment_id, title, description, due_date, student_id) FROM stdin;
    public               postgres    false    220   �       $          0    16390    students 
   TABLE DATA           ]   COPY public.students (student_id, first_name, last_name, email, enrollment_date) FROM stdin;
    public               postgres    false    218   $       /           0    0    assignments_assignment_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.assignments_assignment_id_seq', 1, true);
          public               postgres    false    219            0           0    0    students_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.students_student_id_seq', 1, true);
          public               postgres    false    217            �           2606    16404    assignments assignments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (assignment_id);
 F   ALTER TABLE ONLY public.assignments DROP CONSTRAINT assignments_pkey;
       public                 postgres    false    220            �           2606    16395    students students_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public                 postgres    false    218            �           2606    16405 '   assignments assignments_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 Q   ALTER TABLE ONLY public.assignments DROP CONSTRAINT assignments_student_id_fkey;
       public               postgres    false    4750    218    220            &   _   x��A
� е��_�� Z�:��]�?G�~/�K�{�S��!�⒅
��S�aZ�UB��,ֲ�?�/nO�6:�.�6-iJ[H�c���U      $   7   x�3�t*J�K������K-�L��ц&��z�٩%��z�)��1~\1z\\\ �H�     