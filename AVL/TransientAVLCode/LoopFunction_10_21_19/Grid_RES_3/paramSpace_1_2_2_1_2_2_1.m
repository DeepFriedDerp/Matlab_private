function [aeroForces] = paramSpace_1_2_2_1_2_2_1(sailStates,airStates)

	CL = (3.639424)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.642923)*sailStates.p + (28.000395)*sailStates.q + (-0.574647)*sailStates.r + (0.010362)*sailStates.de;
	CD = 0.047980;
	CY = (-0.034402)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.104271)*sailStates.p + (-0.589407)*sailStates.q + (-0.018386)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (0.578921)*sailStates.alpha + (0.075647)*sailStates.beta + (-0.469726)*sailStates.p + (3.158220)*sailStates.q + (-0.354175)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-13.051756)*sailStates.alpha + (0.000000)*sailStates.beta + (5.517114)*sailStates.p + (-111.551048)*sailStates.q + (1.945899)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-0.111680)*sailStates.alpha + (0.013339)*sailStates.beta + (0.202665)*sailStates.p + (-0.454067)*sailStates.q + (-0.012111)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end