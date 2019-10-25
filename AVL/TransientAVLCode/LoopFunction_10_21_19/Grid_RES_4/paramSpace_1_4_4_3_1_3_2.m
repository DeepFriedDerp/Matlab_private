function [aeroForces] = paramSpace_1_4_4_3_1_3_2(sailStates,airStates)

	CL = (4.000764)*sailStates.alpha + (0.002446)*sailStates.beta + (-2.426880)*sailStates.p + (32.531261)*sailStates.q + (-0.179504)*sailStates.r + (0.010149)*sailStates.de;
	CD = -0.132130;
	CY = (-0.057784)*sailStates.alpha + (-0.026192)*sailStates.beta + (0.182413)*sailStates.p + (-0.489619)*sailStates.q + (0.036232)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.157220)*sailStates.alpha + (-0.061830)*sailStates.beta + (-1.100765)*sailStates.p + (8.593677)*sailStates.q + (0.088362)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-14.809884)*sailStates.alpha + (0.106454)*sailStates.beta + (8.723939)*sailStates.p + (-134.519470)*sailStates.q + (0.637040)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.310067)*sailStates.alpha + (-0.006630)*sailStates.beta + (-0.570609)*sailStates.p + (3.428539)*sailStates.q + (-0.052615)*sailStates.r + (0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end