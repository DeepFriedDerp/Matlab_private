function [aeroForces] = paramSpace_3_2_4_1_2_2_3(sailStates,airStates)

	CL = (3.684665)*sailStates.alpha + (0.039610)*sailStates.beta + (-3.450870)*sailStates.p + (42.162064)*sailStates.q + (0.464804)*sailStates.r + (0.011455)*sailStates.de;
	CD = 0.046800;
	CY = (0.021509)*sailStates.alpha + (-0.025079)*sailStates.beta + (0.134315)*sailStates.p + (-0.221995)*sailStates.q + (-0.008827)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.398757)*sailStates.alpha + (-0.046271)*sailStates.beta + (-1.946845)*sailStates.p + (16.696070)*sailStates.q + (0.361728)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-13.382870)*sailStates.alpha + (-0.172540)*sailStates.beta + (11.704206)*sailStates.p + (-161.490479)*sailStates.q + (-1.608221)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.208973)*sailStates.alpha + (0.003602)*sailStates.beta + (-0.160680)*sailStates.p + (0.295220)*sailStates.q + (-0.005065)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end