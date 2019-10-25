function [aeroForces] = paramSpace_2_2_1_1_2_2_2(sailStates,airStates)

	CL = (4.029555)*sailStates.alpha + (-0.034074)*sailStates.beta + (-2.566294)*sailStates.p + (34.993881)*sailStates.q + (-0.346608)*sailStates.r + (0.010995)*sailStates.de;
	CD = 0.043980;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.098070)*sailStates.p + (-0.000000)*sailStates.q + (-0.006428)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.280041)*sailStates.alpha + (0.041355)*sailStates.beta + (-1.224179)*sailStates.p + (9.989675)*sailStates.q + (-0.265721)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.587755)*sailStates.alpha + (0.153274)*sailStates.beta + (8.751653)*sailStates.p + (-137.194580)*sailStates.q + (1.206269)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.047046)*sailStates.alpha + (0.003060)*sailStates.beta + (0.133911)*sailStates.p + (-0.236365)*sailStates.q + (-0.003654)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end