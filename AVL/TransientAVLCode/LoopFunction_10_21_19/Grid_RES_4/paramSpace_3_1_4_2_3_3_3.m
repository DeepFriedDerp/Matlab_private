function [aeroForces] = paramSpace_3_1_4_2_3_3_3(sailStates,airStates)

	CL = (4.239673)*sailStates.alpha + (0.316312)*sailStates.beta + (-2.982977)*sailStates.p + (39.151535)*sailStates.q + (1.205943)*sailStates.r + (0.011272)*sailStates.de;
	CD = -0.370890;
	CY = (0.162625)*sailStates.alpha + (-0.023861)*sailStates.beta + (0.466260)*sailStates.p + (0.668510)*sailStates.q + (-0.030490)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.393219)*sailStates.alpha + (-0.176204)*sailStates.beta + (-1.589196)*sailStates.p + (13.671793)*sailStates.q + (1.089532)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-13.400050)*sailStates.alpha + (-1.309472)*sailStates.beta + (9.891461)*sailStates.p + (-147.557632)*sailStates.q + (-4.129640)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.367688)*sailStates.alpha + (0.016558)*sailStates.beta + (-0.958203)*sailStates.p + (3.371825)*sailStates.q + (-0.002206)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end