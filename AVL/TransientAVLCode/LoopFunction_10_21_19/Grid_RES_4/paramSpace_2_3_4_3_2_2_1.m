function [aeroForces] = paramSpace_2_3_4_3_2_2_1(sailStates,airStates)

	CL = (4.048695)*sailStates.alpha + (0.010893)*sailStates.beta + (-2.306759)*sailStates.p + (32.835835)*sailStates.q + (-0.286822)*sailStates.r + (0.010963)*sailStates.de;
	CD = 0.030920;
	CY = (-0.003552)*sailStates.alpha + (-0.024993)*sailStates.beta + (-0.042701)*sailStates.p + (-0.065300)*sailStates.q + (-0.002806)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.091261)*sailStates.alpha + (0.029875)*sailStates.beta + (-0.979299)*sailStates.p + (7.610831)*sailStates.q + (-0.164134)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.737618)*sailStates.alpha + (-0.010663)*sailStates.beta + (7.892602)*sailStates.p + (-130.047943)*sailStates.q + (0.943953)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.014228)*sailStates.alpha + (0.001675)*sailStates.beta + (0.062136)*sailStates.p + (-0.210602)*sailStates.q + (-0.002746)*sailStates.r + (-0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end