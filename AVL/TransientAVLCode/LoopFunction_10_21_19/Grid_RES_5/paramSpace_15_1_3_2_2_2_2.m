function [aeroForces] = paramSpace_15_1_3_2_2_2_2(sailStates,airStates)

	CL = (3.859886)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.696185)*sailStates.p + (39.602661)*sailStates.q + (1.772540)*sailStates.r + (0.010930)*sailStates.de;
	CD = -0.048340;
	CY = (0.073360)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.494698)*sailStates.p + (0.199285)*sailStates.q + (-0.123335)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.232111)*sailStates.alpha + (-0.255180)*sailStates.beta + (-1.327724)*sailStates.p + (12.226690)*sailStates.q + (1.355830)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-11.929239)*sailStates.alpha + (0.000000)*sailStates.beta + (8.182343)*sailStates.p + (-139.959488)*sailStates.q + (-5.884740)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.311908)*sailStates.alpha + (0.063624)*sailStates.beta + (-0.853672)*sailStates.p + (2.496711)*sailStates.q + (-0.042711)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end