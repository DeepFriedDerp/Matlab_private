function [aeroForces] = paramSpace_1_2_1_3_3_1_3(sailStates,airStates)

	CL = (4.298340)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.786338)*sailStates.p + (39.576141)*sailStates.q + (-1.768195)*sailStates.r + (0.011182)*sailStates.de;
	CD = -0.247460;
	CY = (0.019961)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.628254)*sailStates.p + (0.665001)*sailStates.q + (-0.110841)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.526975)*sailStates.alpha + (0.287606)*sailStates.beta + (-1.387641)*sailStates.p + (12.440503)*sailStates.q + (-1.426189)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-13.005620)*sailStates.alpha + (0.000000)*sailStates.beta + (8.592894)*sailStates.p + (-141.960541)*sailStates.q + (5.927770)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.188127)*sailStates.alpha + (0.050713)*sailStates.beta + (1.178711)*sailStates.p + (-4.889133)*sailStates.q + (-0.000641)*sailStates.r + (-0.000276)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end