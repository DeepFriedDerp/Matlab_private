function [aeroForces] = paramSpace_1_1_3_2_2_2_2(sailStates,airStates)

	CL = (3.913176)*sailStates.alpha + (-0.137468)*sailStates.beta + (-2.486652)*sailStates.p + (34.946472)*sailStates.q + (-0.863206)*sailStates.r + (0.010709)*sailStates.de;
	CD = 0.050390;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.177644)*sailStates.p + (-0.000000)*sailStates.q + (-0.031323)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.265120)*sailStates.alpha + (0.037526)*sailStates.beta + (-1.209486)*sailStates.p + (10.349026)*sailStates.q + (-0.576482)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-14.000608)*sailStates.alpha + (0.427817)*sailStates.beta + (8.271648)*sailStates.p + (-134.612778)*sailStates.q + (2.879362)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.124589)*sailStates.alpha + (0.013195)*sailStates.beta + (0.235531)*sailStates.p + (-0.496496)*sailStates.q + (-0.022745)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end