function [aeroForces] = paramSpace_14_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.482880)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.884341)*sailStates.p + (34.493111)*sailStates.q + (-0.289094)*sailStates.r + (0.009928)*sailStates.de;
	CD = -0.704430;
	CY = (-0.038180)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.452262)*sailStates.p + (0.550478)*sailStates.q + (0.096111)*sailStates.r + (0.000118)*sailStates.de;

	Cl = (1.618459)*sailStates.alpha + (0.204319)*sailStates.beta + (-1.544774)*sailStates.p + (12.481890)*sailStates.q + (-0.523905)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-15.334528)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.919686)*sailStates.p + (-149.810104)*sailStates.q + (0.845235)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (-0.111237)*sailStates.alpha + (-0.043429)*sailStates.beta + (1.306406)*sailStates.p + (-7.413671)*sailStates.q + (-0.096559)*sailStates.r + (-0.000261)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end