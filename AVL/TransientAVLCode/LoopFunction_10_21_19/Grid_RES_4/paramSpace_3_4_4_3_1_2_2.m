function [aeroForces] = paramSpace_3_4_4_3_1_2_2(sailStates,airStates)

	CL = (3.999211)*sailStates.alpha + (-0.119226)*sailStates.beta + (-2.541751)*sailStates.p + (34.755058)*sailStates.q + (0.474069)*sailStates.r + (0.010827)*sailStates.de;
	CD = 0.033970;
	CY = (-0.062144)*sailStates.alpha + (-0.024097)*sailStates.beta + (0.177853)*sailStates.p + (-0.498142)*sailStates.q + (-0.011710)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.190771)*sailStates.alpha + (-0.098249)*sailStates.beta + (-1.146700)*sailStates.p + (9.117669)*sailStates.q + (0.365637)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.393991)*sailStates.alpha + (0.516681)*sailStates.beta + (8.627869)*sailStates.p + (-135.916275)*sailStates.q + (-1.631335)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.054357)*sailStates.alpha + (0.003895)*sailStates.beta + (-0.302529)*sailStates.p + (1.405846)*sailStates.q + (0.000595)*sailStates.r + (0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end