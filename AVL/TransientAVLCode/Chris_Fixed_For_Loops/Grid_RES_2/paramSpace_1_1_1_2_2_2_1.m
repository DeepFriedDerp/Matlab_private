function [aeroForces] = paramSpace_1_1_1_2_2_2_1(sailStates,airStates)

	CL = (5.182236)*sailStates.alpha + (0.600134)*sailStates.beta + (-5.440476)*sailStates.p + (51.653419)*sailStates.q + (2.076451)*sailStates.r + (0.010618)*sailStates.de;
	CD = -5.817390;
	CY = (1.946233)*sailStates.alpha + (-0.032356)*sailStates.beta + (1.188048)*sailStates.p + (3.236018)*sailStates.q + (0.156180)*sailStates.r + (0.000727)*sailStates.de;

	Cl = (-0.087406)*sailStates.alpha + (-0.611535)*sailStates.beta + (-3.734938)*sailStates.p + (32.279213)*sailStates.q + (2.222548)*sailStates.r + (0.004786)*sailStates.de;
	Cm = (0.191076)*sailStates.alpha + (-2.397819)*sailStates.beta + (20.296396)*sailStates.p + (-221.334824)*sailStates.q + (-6.934545)*sailStates.r + (-0.079415)*sailStates.de;
	Cn = (-7.170300)*sailStates.alpha + (-0.105659)*sailStates.beta + (-3.270317)*sailStates.p + (14.610384)*sailStates.q + (-0.072887)*sailStates.r + (-0.000474)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end