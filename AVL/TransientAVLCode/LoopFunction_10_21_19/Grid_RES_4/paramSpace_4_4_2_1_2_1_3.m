function [aeroForces] = paramSpace_4_4_2_1_2_1_3(sailStates,airStates)

	CL = (5.359513)*sailStates.alpha + (0.281480)*sailStates.beta + (-3.143960)*sailStates.p + (34.321598)*sailStates.q + (-0.935038)*sailStates.r + (0.009386)*sailStates.de;
	CD = -1.930300;
	CY = (-0.341791)*sailStates.alpha + (-0.022747)*sailStates.beta + (-0.714086)*sailStates.p + (-0.662186)*sailStates.q + (0.142064)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.678727)*sailStates.alpha + (0.433919)*sailStates.beta + (-1.753029)*sailStates.p + (13.879188)*sailStates.q + (-1.157028)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-14.930728)*sailStates.alpha + (-1.171246)*sailStates.beta + (12.339674)*sailStates.p + (-157.701080)*sailStates.q + (3.002656)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.585777)*sailStates.alpha + (-0.061603)*sailStates.beta + (1.963219)*sailStates.p + (-9.566620)*sailStates.q + (-0.091106)*sailStates.r + (0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end