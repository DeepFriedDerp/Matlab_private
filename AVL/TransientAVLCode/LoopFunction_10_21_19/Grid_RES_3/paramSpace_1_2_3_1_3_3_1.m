function [aeroForces] = paramSpace_1_2_3_1_3_3_1(sailStates,airStates)

	CL = (4.863842)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.447424)*sailStates.p + (21.128111)*sailStates.q + (1.249784)*sailStates.r + (0.009077)*sailStates.de;
	CD = -1.664350;
	CY = (-0.138879)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.684414)*sailStates.p + (1.081942)*sailStates.q + (0.120784)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.403452)*sailStates.alpha + (-0.385374)*sailStates.beta + (-0.394559)*sailStates.p + (1.368968)*sailStates.q + (1.410117)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-14.995101)*sailStates.alpha + (-0.000001)*sailStates.beta + (6.327812)*sailStates.p + (-109.437057)*sailStates.q + (-4.141239)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (1.388188)*sailStates.alpha + (-0.067952)*sailStates.beta + (-1.617273)*sailStates.p + (6.342035)*sailStates.q + (-0.024723)*sailStates.r + (-0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end