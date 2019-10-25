function [aeroForces] = paramSpace_4_4_1_1_2_1_3(sailStates,airStates)

	CL = (5.419678)*sailStates.alpha + (0.302055)*sailStates.beta + (-3.144891)*sailStates.p + (34.272610)*sailStates.q + (-0.944714)*sailStates.r + (0.009476)*sailStates.de;
	CD = -1.963500;
	CY = (-0.347330)*sailStates.alpha + (-0.022885)*sailStates.beta + (-0.728660)*sailStates.p + (-0.662189)*sailStates.q + (0.145011)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.681951)*sailStates.alpha + (0.442771)*sailStates.beta + (-1.753466)*sailStates.p + (13.877019)*sailStates.q + (-1.181134)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-15.129007)*sailStates.alpha + (-1.305223)*sailStates.beta + (12.351004)*sailStates.p + (-157.701080)*sailStates.q + (3.059620)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.602232)*sailStates.alpha + (-0.063213)*sailStates.beta + (1.985137)*sailStates.p + (-9.577521)*sailStates.q + (-0.091059)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end