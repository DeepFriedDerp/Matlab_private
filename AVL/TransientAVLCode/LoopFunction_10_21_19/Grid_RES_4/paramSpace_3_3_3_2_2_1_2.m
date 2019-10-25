function [aeroForces] = paramSpace_3_3_3_2_2_1_2(sailStates,airStates)

	CL = (4.455876)*sailStates.alpha + (0.051759)*sailStates.beta + (-2.540207)*sailStates.p + (33.769630)*sailStates.q + (-0.671257)*sailStates.r + (0.010782)*sailStates.de;
	CD = -0.403950;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.393748)*sailStates.p + (0.000000)*sailStates.q + (0.025808)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.330875)*sailStates.alpha + (0.211457)*sailStates.beta + (-1.183324)*sailStates.p + (9.266195)*sailStates.q + (-0.704574)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.119738)*sailStates.alpha + (-0.201099)*sailStates.beta + (8.979165)*sailStates.p + (-137.194580)*sailStates.q + (2.264888)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.238823)*sailStates.alpha + (-0.012238)*sailStates.beta + (0.956799)*sailStates.p + (-4.613421)*sailStates.q + (-0.011463)*sailStates.r + (-0.000087)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end