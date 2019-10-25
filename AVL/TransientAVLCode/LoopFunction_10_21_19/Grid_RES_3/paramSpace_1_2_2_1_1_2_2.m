function [aeroForces] = paramSpace_1_2_2_1_1_2_2(sailStates,airStates)

	CL = (3.898362)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.546790)*sailStates.p + (34.997326)*sailStates.q + (-0.450701)*sailStates.r + (0.010759)*sailStates.de;
	CD = 0.042630;
	CY = (-0.203504)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.068362)*sailStates.p + (-1.671348)*sailStates.q + (0.012054)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.194817)*sailStates.alpha + (0.032488)*sailStates.beta + (-1.202113)*sailStates.p + (9.810574)*sailStates.q + (-0.252009)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-14.206755)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.825787)*sailStates.p + (-137.643188)*sailStates.q + (1.565117)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.380814)*sailStates.alpha + (0.005729)*sailStates.beta + (-0.285236)*sailStates.p + (3.181776)*sailStates.q + (-0.057356)*sailStates.r + (0.000495)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end