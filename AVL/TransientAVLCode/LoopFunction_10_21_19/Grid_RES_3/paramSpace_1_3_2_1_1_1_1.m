function [aeroForces] = paramSpace_1_3_2_1_1_1_1(sailStates,airStates)

	CL = (5.299029)*sailStates.alpha + (0.535796)*sailStates.beta + (-1.822003)*sailStates.p + (34.577362)*sailStates.q + (-2.383846)*sailStates.r + (0.011603)*sailStates.de;
	CD = -1.811370;
	CY = (0.014653)*sailStates.alpha + (-0.030527)*sailStates.beta + (-0.872506)*sailStates.p + (-2.260754)*sailStates.q + (-0.153846)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.469358)*sailStates.alpha + (0.651371)*sailStates.beta + (-0.494959)*sailStates.p + (4.347478)*sailStates.q + (-2.076444)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-8.960912)*sailStates.alpha + (-2.067250)*sailStates.beta + (4.659603)*sailStates.p + (-112.748650)*sailStates.q + (7.959579)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (-1.472131)*sailStates.alpha + (0.091017)*sailStates.beta + (1.999617)*sailStates.p + (-7.324241)*sailStates.q + (0.001842)*sailStates.r + (0.000501)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end