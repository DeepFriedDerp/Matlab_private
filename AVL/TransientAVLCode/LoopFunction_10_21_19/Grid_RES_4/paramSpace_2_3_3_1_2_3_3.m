function [aeroForces] = paramSpace_2_3_3_1_2_3_3(sailStates,airStates)

	CL = (5.897342)*sailStates.alpha + (-0.148175)*sailStates.beta + (-3.393542)*sailStates.p + (39.469196)*sailStates.q + (1.777449)*sailStates.r + (0.010975)*sailStates.de;
	CD = -2.194080;
	CY = (0.373750)*sailStates.alpha + (-0.024905)*sailStates.beta + (0.946089)*sailStates.p + (0.221995)*sailStates.q + (0.062018)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.916555)*sailStates.alpha + (-0.519525)*sailStates.beta + (-1.896156)*sailStates.p + (15.588609)*sailStates.q + (1.768940)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-14.359351)*sailStates.alpha + (0.600119)*sailStates.beta + (12.205653)*sailStates.p + (-161.490479)*sailStates.q + (-6.042350)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.994748)*sailStates.alpha + (-0.030280)*sailStates.beta + (-2.239783)*sailStates.p + (10.412786)*sailStates.q + (-0.022792)*sailStates.r + (0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end