function [aeroForces] = paramSpace_4_3_2_2_1_2_2(sailStates,airStates)

	CL = (4.003800)*sailStates.alpha + (-0.074312)*sailStates.beta + (-2.458187)*sailStates.p + (35.382366)*sailStates.q + (1.175771)*sailStates.r + (0.010675)*sailStates.de;
	CD = 0.030120;
	CY = (-0.098261)*sailStates.alpha + (-0.024198)*sailStates.beta + (0.334638)*sailStates.p + (-0.756270)*sailStates.q + (-0.066537)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.271992)*sailStates.alpha + (-0.162350)*sailStates.beta + (-1.133599)*sailStates.p + (9.746618)*sailStates.q + (0.821394)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-13.840740)*sailStates.alpha + (0.255082)*sailStates.beta + (7.917357)*sailStates.p + (-133.768066)*sailStates.q + (-3.915030)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.025398)*sailStates.alpha + (0.027188)*sailStates.beta + (-0.554246)*sailStates.p + (2.435487)*sailStates.q + (-0.008363)*sailStates.r + (0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end