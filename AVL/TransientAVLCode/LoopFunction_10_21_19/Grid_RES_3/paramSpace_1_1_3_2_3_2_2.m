function [aeroForces] = paramSpace_1_1_3_2_3_2_2(sailStates,airStates)

	CL = (4.012882)*sailStates.alpha + (-0.161621)*sailStates.beta + (-2.466614)*sailStates.p + (35.057831)*sailStates.q + (-1.058594)*sailStates.r + (0.010706)*sailStates.de;
	CD = 0.020750;
	CY = (0.097487)*sailStates.alpha + (-0.026556)*sailStates.beta + (-0.298833)*sailStates.p + (0.759371)*sailStates.q + (-0.052620)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.346260)*sailStates.alpha + (0.056282)*sailStates.beta + (-1.197021)*sailStates.p + (10.384246)*sailStates.q + (-0.736651)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-14.047892)*sailStates.alpha + (0.508160)*sailStates.beta + (8.040116)*sailStates.p + (-133.652283)*sailStates.q + (3.515732)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.002211)*sailStates.alpha + (0.020861)*sailStates.beta + (0.489566)*sailStates.p + (-2.218854)*sailStates.q + (-0.006689)*sailStates.r + (-0.000268)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end