function [aeroForces] = paramSpace_3_1_3_1_1_2_3(sailStates,airStates)

	CL = (3.876102)*sailStates.alpha + (0.157328)*sailStates.beta + (-3.414618)*sailStates.p + (41.972553)*sailStates.q + (0.894469)*sailStates.r + (0.011311)*sailStates.de;
	CD = -0.041800;
	CY = (-0.097964)*sailStates.alpha + (-0.027032)*sailStates.beta + (0.392260)*sailStates.p + (-1.915493)*sailStates.q + (-0.025777)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.614428)*sailStates.alpha + (-0.054896)*sailStates.beta + (-1.959716)*sailStates.p + (17.052757)*sailStates.q + (0.698639)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.647950)*sailStates.alpha + (-0.583342)*sailStates.beta + (11.447064)*sailStates.p + (-159.650192)*sailStates.q + (-3.016637)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.257534)*sailStates.alpha + (0.009842)*sailStates.beta + (-0.697437)*sailStates.p + (4.058268)*sailStates.q + (0.008409)*sailStates.r + (0.000607)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end