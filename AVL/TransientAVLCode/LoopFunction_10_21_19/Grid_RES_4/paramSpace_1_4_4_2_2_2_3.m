function [aeroForces] = paramSpace_1_4_4_2_2_2_3(sailStates,airStates)

	CL = (3.786674)*sailStates.alpha + (0.194222)*sailStates.beta + (-2.849963)*sailStates.p + (38.243343)*sailStates.q + (-1.121097)*sailStates.r + (0.010801)*sailStates.de;
	CD = 0.065420;
	CY = (-0.004208)*sailStates.alpha + (-0.023922)*sailStates.beta + (-0.246153)*sailStates.p + (0.301043)*sailStates.q + (-0.048930)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.240729)*sailStates.alpha + (0.184686)*sailStates.beta + (-1.425648)*sailStates.p + (12.296976)*sailStates.q + (-0.754936)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-13.516075)*sailStates.alpha + (-0.608173)*sailStates.beta + (9.376116)*sailStates.p + (-144.677322)*sailStates.q + (3.728567)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.238036)*sailStates.alpha + (0.025193)*sailStates.beta + (0.319424)*sailStates.p + (-0.856165)*sailStates.q + (-0.030567)*sailStates.r + (-0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end