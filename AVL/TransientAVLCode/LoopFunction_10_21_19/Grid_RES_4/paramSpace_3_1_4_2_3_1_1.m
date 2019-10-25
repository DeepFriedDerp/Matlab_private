function [aeroForces] = paramSpace_3_1_4_2_3_1_1(sailStates,airStates)

	CL = (4.511471)*sailStates.alpha + (-0.169663)*sailStates.beta + (-2.126033)*sailStates.p + (30.218609)*sailStates.q + (-0.919906)*sailStates.r + (0.010404)*sailStates.de;
	CD = -0.508430;
	CY = (0.191175)*sailStates.alpha + (-0.023582)*sailStates.beta + (-0.520387)*sailStates.p + (0.870358)*sailStates.q + (0.034200)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.358836)*sailStates.alpha + (0.161598)*sailStates.beta + (-0.915460)*sailStates.p + (6.936381)*sailStates.q + (-0.886111)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-15.060086)*sailStates.alpha + (0.589175)*sailStates.beta + (7.655271)*sailStates.p + (-125.466835)*sailStates.q + (3.076945)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.684057)*sailStates.alpha + (-0.018173)*sailStates.beta + (1.207574)*sailStates.p + (-6.411042)*sailStates.q + (-0.017496)*sailStates.r + (-0.000354)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end