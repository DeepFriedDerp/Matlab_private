function [aeroForces] = paramSpace_1_2_2_1_1_3_3(sailStates,airStates)

	CL = (6.349179)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.254655)*sailStates.p + (35.178982)*sailStates.q + (1.488399)*sailStates.r + (0.009791)*sailStates.de;
	CD = -2.526600;
	CY = (0.269094)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.010571)*sailStates.p + (-1.081943)*sailStates.q + (0.178191)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (2.517789)*sailStates.alpha + (-0.462127)*sailStates.beta + (-1.859006)*sailStates.p + (14.676374)*sailStates.q + (1.583977)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-16.275215)*sailStates.alpha + (-0.000000)*sailStates.beta + (12.935734)*sailStates.p + (-161.621323)*sailStates.q + (-4.849391)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (-0.730982)*sailStates.alpha + (-0.081485)*sailStates.beta + (-2.564478)*sailStates.p + (13.598379)*sailStates.q + (-0.115090)*sailStates.r + (0.000550)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end