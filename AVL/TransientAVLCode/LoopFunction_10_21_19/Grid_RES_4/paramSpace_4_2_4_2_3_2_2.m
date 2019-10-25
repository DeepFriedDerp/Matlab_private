function [aeroForces] = paramSpace_4_2_4_2_3_2_2(sailStates,airStates)

	CL = (3.751450)*sailStates.alpha + (0.070037)*sailStates.beta + (-2.501406)*sailStates.p + (35.230492)*sailStates.q + (0.805511)*sailStates.r + (0.010507)*sailStates.de;
	CD = 0.102980;
	CY = (0.094285)*sailStates.alpha + (-0.024093)*sailStates.beta + (0.123233)*sailStates.p + (0.756270)*sailStates.q + (-0.024431)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.171712)*sailStates.alpha + (-0.073927)*sailStates.beta + (-1.192222)*sailStates.p + (10.069224)*sailStates.q + (0.556810)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-13.432544)*sailStates.alpha + (-0.284480)*sailStates.beta + (8.415782)*sailStates.p + (-135.926239)*sailStates.q + (-2.762755)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.253716)*sailStates.alpha + (0.015846)*sailStates.beta + (-0.084579)*sailStates.p + (-1.062591)*sailStates.q + (-0.047155)*sailStates.r + (-0.000222)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end