function [aeroForces] = paramSpace_2_1_4_3_3_2_2(sailStates,airStates)

	CL = (4.037580)*sailStates.alpha + (-0.054862)*sailStates.beta + (-2.542479)*sailStates.p + (34.705704)*sailStates.q + (-0.448059)*sailStates.r + (0.010918)*sailStates.de;
	CD = 0.022500;
	CY = (0.062138)*sailStates.alpha + (-0.025160)*sailStates.beta + (-0.133292)*sailStates.p + (0.498142)*sailStates.q + (-0.008684)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.333172)*sailStates.alpha + (0.016784)*sailStates.beta + (-1.244758)*sailStates.p + (10.323976)*sailStates.q + (-0.300700)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.589381)*sailStates.alpha + (0.107960)*sailStates.beta + (8.637726)*sailStates.p + (-135.916275)*sailStates.q + (1.480939)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.033450)*sailStates.alpha + (0.003112)*sailStates.beta + (0.230300)*sailStates.p + (-1.292149)*sailStates.q + (0.000376)*sailStates.r + (-0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end