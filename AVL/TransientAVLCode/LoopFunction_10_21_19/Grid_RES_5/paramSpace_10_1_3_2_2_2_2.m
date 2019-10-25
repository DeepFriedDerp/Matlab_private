function [aeroForces] = paramSpace_10_1_3_2_2_2_2(sailStates,airStates)

	CL = (4.136635)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.800678)*sailStates.p + (37.412415)*sailStates.q + (0.820723)*sailStates.r + (0.011283)*sailStates.de;
	CD = -0.088460;
	CY = (0.069947)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.284975)*sailStates.p + (0.351850)*sailStates.q + (-0.019915)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.328548)*sailStates.alpha + (-0.156704)*sailStates.beta + (-1.390542)*sailStates.p + (11.594380)*sailStates.q + (0.695776)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.244956)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.389485)*sailStates.p + (-143.366257)*sailStates.q + (-2.795995)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (-0.126210)*sailStates.alpha + (0.010958)*sailStates.beta + (-0.560352)*sailStates.p + (1.937429)*sailStates.q + (-0.002726)*sailStates.r + (-0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end