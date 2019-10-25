function [aeroForces] = paramSpace_3_3_1_3_3_3_3(sailStates,airStates)

	CL = (4.171138)*sailStates.alpha + (-0.058679)*sailStates.beta + (-2.849344)*sailStates.p + (37.805805)*sailStates.q + (0.876240)*sailStates.r + (0.011375)*sailStates.de;
	CD = -0.127040;
	CY = (0.086381)*sailStates.alpha + (-0.025085)*sailStates.beta + (0.291393)*sailStates.p + (0.432842)*sailStates.q + (-0.019145)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.318901)*sailStates.alpha + (-0.182145)*sailStates.beta + (-1.413000)*sailStates.p + (11.753682)*sailStates.q + (0.723438)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.276723)*sailStates.alpha + (0.199458)*sailStates.beta + (9.542830)*sailStates.p + (-144.575439)*sailStates.q + (-2.942214)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.138006)*sailStates.alpha + (0.010669)*sailStates.beta + (-0.604197)*sailStates.p + (2.272567)*sailStates.q + (-0.001935)*sailStates.r + (-0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end