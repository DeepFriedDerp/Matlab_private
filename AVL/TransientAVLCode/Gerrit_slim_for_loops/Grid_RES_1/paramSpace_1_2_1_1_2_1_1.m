function [aeroForces] = paramSpace_1_2_1_1_2_1_1(sailStates,airStates)

	CL = (7.815016)*sailStates.alpha + (-0.561303)*sailStates.beta + (-2.581605)*sailStates.p + (29.192369)*sailStates.q + (0.550142)*sailStates.r + (0.008615)*sailStates.de;
	CD = -5.316720;
	CY = (1.875170)*sailStates.alpha + (0.001359)*sailStates.beta + (-0.128493)*sailStates.p + (15.294677)*sailStates.q + (-0.014750)*sailStates.r + (0.003259)*sailStates.de;

	Cl = (-2.251704)*sailStates.alpha + (-0.579404)*sailStates.beta + (-1.382299)*sailStates.p + (11.274818)*sailStates.q + (1.175744)*sailStates.r + (0.000368)*sailStates.de;
	Cm = (-11.754787)*sailStates.alpha + (2.618637)*sailStates.beta + (9.458786)*sailStates.p + (-138.695999)*sailStates.q + (-2.074796)*sailStates.r + (-0.068464)*sailStates.de;
	Cn = (-1.987605)*sailStates.alpha + (-0.089020)*sailStates.beta + (-0.330376)*sailStates.p + (-9.409809)*sailStates.q + (0.131225)*sailStates.r + (-0.004301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end