function [aeroForces] = paramSpace_2_3_2_1_2_3_3(sailStates,airStates)

	CL = (5.854448)*sailStates.alpha + (-0.140892)*sailStates.beta + (-3.393218)*sailStates.p + (39.486042)*sailStates.q + (1.767387)*sailStates.r + (0.010943)*sailStates.de;
	CD = -2.160720;
	CY = (0.368163)*sailStates.alpha + (-0.024889)*sailStates.beta + (0.930880)*sailStates.p + (0.221995)*sailStates.q + (0.061005)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.914414)*sailStates.alpha + (-0.511338)*sailStates.beta + (-1.896006)*sailStates.p + (15.589355)*sailStates.q + (1.744198)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-14.290677)*sailStates.alpha + (0.553425)*sailStates.beta + (12.201762)*sailStates.p + (-161.490479)*sailStates.q + (-5.982996)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.976875)*sailStates.alpha + (-0.029716)*sailStates.beta + (-2.217320)*sailStates.p + (10.401418)*sailStates.q + (-0.022852)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end