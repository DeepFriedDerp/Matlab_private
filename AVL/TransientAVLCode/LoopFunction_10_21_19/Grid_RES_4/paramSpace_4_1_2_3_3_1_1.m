function [aeroForces] = paramSpace_4_1_2_3_3_1_1(sailStates,airStates)

	CL = (3.950362)*sailStates.alpha + (0.009315)*sailStates.beta + (-2.175442)*sailStates.p + (30.442745)*sailStates.q + (0.087348)*sailStates.r + (0.009944)*sailStates.de;
	CD = -0.129860;
	CY = (0.102562)*sailStates.alpha + (-0.022679)*sailStates.beta + (-0.198965)*sailStates.p + (0.684400)*sailStates.q + (0.039552)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.180863)*sailStates.alpha + (0.075804)*sailStates.beta + (-0.989020)*sailStates.p + (7.802059)*sailStates.q + (-0.128751)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-14.640115)*sailStates.alpha + (0.020991)*sailStates.beta + (7.904451)*sailStates.p + (-127.495163)*sailStates.q + (-0.351719)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.405513)*sailStates.alpha + (-0.022324)*sailStates.beta + (0.591389)*sailStates.p + (-3.704779)*sailStates.q + (-0.052900)*sailStates.r + (-0.000235)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end