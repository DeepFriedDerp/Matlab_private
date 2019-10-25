function [aeroForces] = paramSpace_3_1_2_2_1_2_3(sailStates,airStates)

	CL = (3.988045)*sailStates.alpha + (0.093412)*sailStates.beta + (-2.941724)*sailStates.p + (37.995701)*sailStates.q + (0.580107)*sailStates.r + (0.011087)*sailStates.de;
	CD = 0.010360;
	CY = (-0.074157)*sailStates.alpha + (-0.025623)*sailStates.beta + (0.208271)*sailStates.p + (-0.870359)*sailStates.q + (-0.013620)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.475669)*sailStates.alpha + (-0.028906)*sailStates.beta + (-1.571499)*sailStates.p + (13.378333)*sailStates.q + (0.425359)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.305477)*sailStates.alpha + (-0.301738)*sailStates.beta + (9.946107)*sailStates.p + (-146.834122)*sailStates.q + (-1.942436)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.045605)*sailStates.alpha + (0.005014)*sailStates.beta + (-0.354148)*sailStates.p + (1.939752)*sailStates.q + (0.002006)*sailStates.r + (0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end