function [aeroForces] = paramSpace_2_1_2_3_2_2_1(sailStates,airStates)

	CL = (3.966731)*sailStates.alpha + (-0.075099)*sailStates.beta + (-2.286783)*sailStates.p + (32.602654)*sailStates.q + (-0.300966)*sailStates.r + (0.010737)*sailStates.de;
	CD = 0.032160;
	CY = (-0.000337)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.071874)*sailStates.p + (-0.065300)*sailStates.q + (-0.004709)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.179374)*sailStates.alpha + (0.019198)*sailStates.beta + (-1.035050)*sailStates.p + (8.344088)*sailStates.q + (-0.214061)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.377367)*sailStates.alpha + (0.302656)*sailStates.beta + (7.819676)*sailStates.p + (-129.003830)*sailStates.q + (1.031213)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.019638)*sailStates.alpha + (0.002137)*sailStates.beta + (0.101017)*sailStates.p + (-0.179229)*sailStates.q + (-0.002995)*sailStates.r + (0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end