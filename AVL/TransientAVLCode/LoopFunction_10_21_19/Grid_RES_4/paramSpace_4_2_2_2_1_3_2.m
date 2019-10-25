function [aeroForces] = paramSpace_4_2_2_2_1_3_2(sailStates,airStates)

	CL = (4.847700)*sailStates.alpha + (0.153591)*sailStates.beta + (-2.535396)*sailStates.p + (38.984699)*sailStates.q + (2.198486)*sailStates.r + (0.011388)*sailStates.de;
	CD = -0.637210;
	CY = (-0.106009)*sailStates.alpha + (-0.025754)*sailStates.beta + (0.803325)*sailStates.p + (-0.756272)*sailStates.q + (-0.159764)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.677184)*sailStates.alpha + (-0.323372)*sailStates.beta + (-1.189562)*sailStates.p + (11.094674)*sailStates.q + (1.776146)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-12.738751)*sailStates.alpha + (-0.558291)*sailStates.beta + (7.248608)*sailStates.p + (-133.768066)*sailStates.q + (-7.277059)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.138347)*sailStates.alpha + (0.075377)*sailStates.beta + (-1.614372)*sailStates.p + (7.137965)*sailStates.q + (0.014827)*sailStates.r + (0.000351)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end