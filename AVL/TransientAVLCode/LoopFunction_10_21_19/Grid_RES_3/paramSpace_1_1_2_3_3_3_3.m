function [aeroForces] = paramSpace_1_1_2_3_3_3_3(sailStates,airStates)

	CL = (3.908064)*sailStates.alpha + (-0.052755)*sailStates.beta + (-2.681118)*sailStates.p + (35.133102)*sailStates.q + (-0.431829)*sailStates.r + (0.010317)*sailStates.de;
	CD = -0.044750;
	CY = (0.081414)*sailStates.alpha + (-0.026506)*sailStates.beta + (0.001215)*sailStates.p + (0.665001)*sailStates.q + (0.000214)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.347877)*sailStates.alpha + (-0.055218)*sailStates.beta + (-1.394232)*sailStates.p + (11.806668)*sailStates.q + (-0.172527)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-14.323584)*sailStates.alpha + (0.150531)*sailStates.beta + (9.318570)*sailStates.p + (-141.044128)*sailStates.q + (1.473277)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.127553)*sailStates.alpha + (-0.008090)*sailStates.beta + (-0.240332)*sailStates.p + (1.432235)*sailStates.q + (-0.029450)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end