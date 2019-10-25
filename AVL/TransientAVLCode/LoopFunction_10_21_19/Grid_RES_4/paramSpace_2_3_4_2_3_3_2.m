function [aeroForces] = paramSpace_2_3_4_2_3_3_2(sailStates,airStates)

	CL = (4.355767)*sailStates.alpha + (-0.056861)*sailStates.beta + (-2.532950)*sailStates.p + (33.778961)*sailStates.q + (0.487713)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.332220;
	CY = (0.094351)*sailStates.alpha + (-0.024783)*sailStates.beta + (0.299284)*sailStates.p + (0.769435)*sailStates.q + (0.019697)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.207077)*sailStates.alpha + (-0.191378)*sailStates.beta + (-1.178747)*sailStates.p + (9.278119)*sailStates.q + (0.588309)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-15.022689)*sailStates.alpha + (0.261082)*sailStates.beta + (8.897454)*sailStates.p + (-136.832825)*sailStates.q + (-1.694959)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.105817)*sailStates.alpha + (-0.011482)*sailStates.beta + (-0.745543)*sailStates.p + (2.908887)*sailStates.q + (-0.005687)*sailStates.r + (-0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end