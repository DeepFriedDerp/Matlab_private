function [aeroForces] = paramSpace_2_4_4_3_3_2_2(sailStates,airStates)

	CL = (4.037580)*sailStates.alpha + (0.054862)*sailStates.beta + (-2.542479)*sailStates.p + (34.705704)*sailStates.q + (-0.448059)*sailStates.r + (0.010918)*sailStates.de;
	CD = 0.022500;
	CY = (0.062138)*sailStates.alpha + (-0.024413)*sailStates.beta + (-0.133292)*sailStates.p + (0.498142)*sailStates.q + (-0.008684)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.184008)*sailStates.alpha + (0.074534)*sailStates.beta + (-1.147054)*sailStates.p + (9.115409)*sailStates.q + (-0.294423)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.589381)*sailStates.alpha + (-0.107960)*sailStates.beta + (8.637726)*sailStates.p + (-135.916275)*sailStates.q + (1.480939)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.055420)*sailStates.alpha + (0.002874)*sailStates.beta + (0.236704)*sailStates.p + (-1.371363)*sailStates.q + (0.000788)*sailStates.r + (-0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end