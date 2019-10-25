function [aeroForces] = paramSpace_6_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.278257)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.363876)*sailStates.p + (34.009048)*sailStates.q + (-0.982509)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.156900;
	CY = (0.081687)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.413566)*sailStates.p + (0.351848)*sailStates.q + (-0.028956)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.265307)*sailStates.alpha + (0.192567)*sailStates.beta + (-1.035460)*sailStates.p + (8.365147)*sailStates.q + (-0.844973)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.374557)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.858688)*sailStates.p + (-131.203201)*sailStates.q + (3.354512)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (-0.264116)*sailStates.alpha + (0.013466)*sailStates.beta + (0.840483)*sailStates.p + (-3.756355)*sailStates.q + (0.004509)*sailStates.r + (-0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end