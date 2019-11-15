function [aeroForces] = paramSpace_4_2_4_2_3_3_1(sailStates,airStates)

	CL = (4.188528)*sailStates.alpha + (0.142280)*sailStates.beta + (-2.191301)*sailStates.p + (35.529671)*sailStates.q + (1.671644)*sailStates.r + (0.011034)*sailStates.de;
	CD = -0.354950;
	CY = (0.047503)*sailStates.alpha + (-0.023742)*sailStates.beta + (0.543932)*sailStates.p + (1.057315)*sailStates.q + (-0.108081)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (0.992583)*sailStates.alpha + (-0.278912)*sailStates.beta + (-0.898674)*sailStates.p + (7.957548)*sailStates.q + (1.377147)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-11.596039)*sailStates.alpha + (-0.563094)*sailStates.beta + (6.496996)*sailStates.p + (-125.069839)*sailStates.q + (-5.600761)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.288502)*sailStates.alpha + (0.061796)*sailStates.beta + (-1.114190)*sailStates.p + (3.640125)*sailStates.q + (-0.017230)*sailStates.r + (-0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end